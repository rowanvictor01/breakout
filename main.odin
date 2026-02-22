package breakout

import "vendor:raylib"
import "entities"


main :: proc()
{
    // Window Constants
    W_WIDTH :: 800
    W_HEIGHT :: 600
    W_TITLE :: "Breakout"
    
    // Create Window
    raylib.InitWindow(W_WIDTH, W_HEIGHT, W_TITLE)
    
    // Paddle
    player_paddle := entities.paddle_create(entities.Entity{x=W_WIDTH/2, y=W_HEIGHT/2, width=50, height=20, color=raylib.WHITE},
					    300)
    // Ball
    ball := entities.ball_create(entities.Entity{x=400, y=300, color=raylib.WHITE}, 12, 300, 300)
    
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
