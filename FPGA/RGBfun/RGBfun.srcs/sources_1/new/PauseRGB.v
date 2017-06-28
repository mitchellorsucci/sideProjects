module PauseRGB(RGB3, RGB2, RGB1, RGB0, slowClk, fastClk, Reset, KEY);
    input slowClk, Reset, KEY, fastClk;
    output wire [2:0] RGB3, RGB2, RGB1, RGB0;
    reg [15:0] 	counter;
    reg [2:0] 	busOut;
    reg [15:0]	RED, GREEN, BLUE;
    reg bflag, gflag, rflag;
    reg [15:0] count;

    /*----------------------------------------
    	Set up the counter for the PWM
    		12 bit resolution
    		max value of 4096
    	------------------------------------*/
    always@(posedge fastClk or negedge Reset)
    	if(!Reset) 
    		counter <= 16'h0000;
    	else
    		counter <= counter + 1'b1;


    always@(posedge slowClk or negedge Reset)
    	if(!Reset)
    		count <= 16'h0000;
    	else if (KEY)
    		count <= count;
    	else
    		count <= count + 1'b1;
    
    /*----------------------------------------
    	Set up the PWM control for each color
    	each color is 33% out of phase
    	------------------------------------*/
	always@(posedge slowClk or negedge Reset) begin
		if(!Reset) begin
			BLUE <= 16'h000;
			GREEN <= 16'h000;
			RED <= 16'h5555; 
		end else if (KEY) begin
			BLUE <= BLUE;
			GREEN <= GREEN;
			RED <= RED;
		end else if (count < 16'h5555) begin // Blue stronger, Red Weaker
			BLUE <= BLUE + 1'b1;
			GREEN <= 12'h000;
			RED <= RED - 1'b1;
		end else if (count < 16'hAAAB) begin // Still blue, Green stronger
			BLUE <= BLUE - 1'b1;
			GREEN <= GREEN + 1'b1;
			RED <= 16'h0000;
		end else begin
			BLUE <= 16'h0000;
			GREEN <= GREEN - 1'b1;
			RED <= RED + 1'b1;
		end
	end



	always@(*) begin
		busOut[0] = (counter < BLUE);
		busOut[1] = (counter < GREEN);
		busOut[2] = (counter < RED);
	end


    assign RGB3[2:0] = busOut[2:0];
    assign RGB2[2:0] = busOut[2:0];
    assign RGB1[2:0] = busOut[2:0];
    assign RGB0[2:0] = busOut[2:0];


endmodule
