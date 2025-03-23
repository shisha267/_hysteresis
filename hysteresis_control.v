module hysteresis_control (
    input logic clk,              
    input logic rst,             
    input logic [11:0] dsignal,   
    output logic can_move_fwd     
);

    
    parameter logic [11:0] V_High = 12'd300;
    parameter logic [11:0] V_Low = 12'd1000;

   
    logic can_move_fwd_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
           
            can_move_fwd_reg <= 1'b0;
        end else begin
           
            if (dsignal >= V_Low) begin
                can_move_fwd_reg <= 1'b0;
            end else if (dsignal <= V_High) begin
                can_move_fwd_reg <= 1'b1;
            end
        end
    end

    assign can_move_fwd = can_move_fwd_reg;

endmodule