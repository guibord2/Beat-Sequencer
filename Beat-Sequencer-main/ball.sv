//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, frame_clk,
               output [9:0]  BallX, BallY, BallS,
					input signed [7:0] xdisp, ydisp 
					);
    
    logic signed [10:0] Ball_X_Motion, Ball_Y_Motion, Ball_Size;
	 logic signed [10:0] Ball_X_Pos, Ball_Y_Pos;
	 
    parameter [10:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [10:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [10:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [10:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [10:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [10:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [10:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [10:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
        end
           
        else 
        begin 
		  
			Ball_Y_Motion <= ydisp; //Ball_Y_Step;
			Ball_X_Motion <= xdisp; //Ball_X_Step;

		  
			
		  
		  
				 if ( ($signed(Ball_Y_Pos) + $signed(Ball_Size)) >= $signed(Ball_Y_Max) )  // Ball is at the bottom edge, BOUNCE!
					  Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
				
				 else if ( ($signed(Ball_Y_Pos) - $signed(Ball_Size)) <= $signed(Ball_Y_Min) )  // Ball is at the top edge, BOUNCE!
					  Ball_Y_Motion <= Ball_Y_Step;
					  
				 else if ( ($signed(Ball_X_Pos) + $signed(Ball_Size)) >= $signed(Ball_X_Max) )  // Ball is at the Right edge, BOUNCE!
					  Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.	
					  
				 else if ( ($signed(Ball_X_Pos) - $signed(Ball_Size)) <= $signed(Ball_X_Min) )  // Ball is at the Left edge, BOUNCE!
					  Ball_X_Motion <= Ball_X_Step;
					  
			Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
			Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);



				 
//				
		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
