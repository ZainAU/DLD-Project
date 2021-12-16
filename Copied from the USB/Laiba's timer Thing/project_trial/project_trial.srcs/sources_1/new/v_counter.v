module v_counter(clk,enable_v, v_count);
    input clk;
    input enable_v;
    output [9:0] v_count;
    reg [9:0] v_count;
    initial v_count = 0;
     
    always @ (posedge clk)
    begin
    if (enable_v ==1)
    begin
    if (v_count <= 523)
    begin
    v_count <= v_count + 1;
    end
    else
    begin
    v_count <= 0;
    end
    end
    end
endmodule