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
    player_paddle := entities.paddle_create(entities.Entity{W_WIDTH/2, W_HEIGHT/2, 50, 20, raylib.WHITE},
					    300)
    
    // Game Loop
    for !raylib.WindowShouldClose()
    {
	// Update States
	entities.paddle_update(&player_paddle)

	// Draw
	raylib.BeginDrawing()
	raylib.ClearBackground(raylib.BLACK)
	
	entities.paddle_draw(&player_paddle)
	raylib.EndDrawing()
    }

    raylib.CloseWindow()
}
