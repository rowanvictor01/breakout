package init

import "vendor:raylib"


/*
    Paddle Configurations
*/
PADDLE_WIDTH :: 100
PADDLE_HEIGHT :: 18
PADDLE_COLOR :: raylib.WHITE
PADDLE_VEL_X :: 450
INIT_PADDLE_X :: (WIN_WIDTH - PADDLE_WIDTH) / 2
INIT_PADDLE_Y :: WIN_HEIGHT - 50


/*
    Ball Configurations
*/
BALL_RADIUS :: 12
BALL_X :: INIT_PADDLE_X  + (PADDLE_WIDTH / 2)
BALL_Y :: INIT_PADDLE_Y - 20
BALL_VEL :: 600
BALL_COLOR :: raylib.WHITE
