package breakout

import "vendor:raylib"
import "entities"
import "collisions"
import "init"


main :: proc()
{
    // Create Window
    raylib.InitWindow(init.WIN_WIDTH, init.WIN_HEIGHT, init.WIN_TITLE)
    
    // Paddle
    player_paddle := entities.paddle_create(entities.Entity{x=init.INIT_PADDLE_X,
							    y=init.INIT_PADDLE_Y,
							    width=init.PADDLE_WIDTH,
							    height=init.PADDLE_HEIGHT,
							    color=init.PADDLE_COLOR}, init.PADDLE_VEL_X)

    // Ball
    ball := entities.ball_create(entities.Entity{x=init.BALL_X, y=init.BALL_Y, color=init.BALL_COLOR}, init.BALL_RADIUS, -init.BALL_VEL)
    
    // Bricks
    bricks := entities.bricks_create()
    
    // Game Loop
    for !raylib.WindowShouldClose()
    {
	// Update States
	entities.paddle_update(&player_paddle)
	entities.ball_update(&ball)
	
	// Collision Checks
	collisions.collision_paddle_border(&player_paddle)
	collisions.collision_ball_border(&ball)

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
