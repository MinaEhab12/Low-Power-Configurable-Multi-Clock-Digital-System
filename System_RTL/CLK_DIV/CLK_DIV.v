module CLK_DIV 
    #(
        parameter DIV_RATIO_WIDTH = 8
    )
    (
    input  wire        i_ref_clk,
    input  wire        i_rst_n,
    input  wire        i_clk_en,
    input  wire [DIV_RATIO_WIDTH - 1 :0]  i_div_ratio,
    output wire        o_div_clk
);

    /*--------------------------------------------------------------
     * Divider Enable: 
     * Active only when divide ratio is not 0 or 1
     *-------------------------------------------------------------*/
    wire div_en;
    assign div_en = i_clk_en && (i_div_ratio != 8'd0) && (i_div_ratio != 8'd1);

    /*--------------------------------------------------------------
     * Odd Divide Ratio Detection
     *-------------------------------------------------------------*/
    wire is_odd_div;
    assign is_odd_div = i_div_ratio[0];

    /*--------------------------------------------------------------
     * Half Divide Ratios
     * - half_ratio        : used for even division
     * - half_ratio_plus1  : used for odd division balancing
     *-------------------------------------------------------------*/
    wire [DIV_RATIO_WIDTH - 2 :0] half_ratio;
    assign half_ratio = i_div_ratio >> 1;

    wire [DIV_RATIO_WIDTH - 2 :0] half_ratio_plus1;
    assign half_ratio_plus1 = (i_div_ratio >> 1) + 1;

    /*--------------------------------------------------------------
     * Output Clock Selection
     * - If divider is disabled: pass through reference clock
     * - If divider is enabled : use divided clock
     *-------------------------------------------------------------*/
    reg div_clk;
    assign o_div_clk = div_en ? div_clk : i_ref_clk;

    /*--------------------------------------------------------------
     * Internal State Registers
     * - odd_phase_sel : controls alternating counts for odd division
     * - div_counter   : counts reference clock cycles
     *-------------------------------------------------------------*/
    reg odd_phase_sel;
    reg [DIV_RATIO_WIDTH - 2 :0] div_counter;

    /*--------------------------------------------------------------
     * Clock Divider Logic
     *-------------------------------------------------------------*/
    always @(posedge i_ref_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            div_clk       <= 1'b0;
            div_counter   <= 7'd1;
            odd_phase_sel <= 1'b0;
        end
        else if (div_en) begin
            if (is_odd_div) begin
                // Odd divide case
                if (odd_phase_sel) begin
                    div_counter <= div_counter + 1;
                    if (div_counter == half_ratio) begin
                        div_clk       <= ~div_clk;
                        div_counter   <= 7'd1;
                        odd_phase_sel <= 1'b0;
                    end
                end
                else begin
                    div_counter <= div_counter + 1;
                    if (div_counter == half_ratio_plus1) begin
                        div_clk       <= ~div_clk;
                        div_counter   <= 7'd1;
                        odd_phase_sel <= 1'b1;
                    end
                end
            end
            else begin
                // Even divide case
                div_counter <= div_counter + 1;
                if (div_counter == half_ratio) begin
                    div_clk     <= ~div_clk;
                    div_counter <= 7'd1;
                end
            end
        end
    end

endmodule


