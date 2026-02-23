package breakout

import "vendor:raylib"
import "entities"


main :: proc()
{
    // Create Window
    raylib.InitWindow(W_WIDTH, W_HEIGHT, W_TITLE)
    
    // Paddle
    player_paddle := entities.paddle_create(entities.Entity{x=INIT_PADDLE_X,
							    y=INIT_PADDLE_Y,
							    width=PADDLE_WIDTH,
							    height=PADDLE_HEIGHT,
							    color=PADDLE_COLOR}, PADDLE_VEL_X)

    // Ball
    ball := entities.ball_create(entities.Entity{x=BALL_X, y=BALL_Y, color=BALL_COLOR}, BALL_RADIUS, BALL_VEL, BALL_VEL)
    
    // Bricks
    bricks := entities.bricks_create()
    
    // Game Loop
    for !raylib.WindowShouldClose()
    {
	// Update States
	entities.paddle_update(&player_paddle)

	// Draw
	raylib.BeginDrawing()
	raylib.ClearBackground(raylib.BLACK)
	
	entities.paddle_draw(&player_paddle)
	entities.ball_draw(&ball)
	entities.bricks_draw(&bricks)

	raylib.EndDrawing()
    }

    raylib.CloseWindow()
}
