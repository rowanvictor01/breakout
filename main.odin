package breakout

import "vendor:raylib"


main :: proc()
{
    // Window Constants
    W_WIDTH :: 800
    W_HEIGHT :: 600
    W_TITLE :: "Breakout"
    
    // Create Window
    raylib.InitWindow(W_WIDTH, W_HEIGHT, W_TITLE)
    
    // Game Loop
    for !raylib.WindowShouldClose()
    {
	raylib.BeginDrawing()
	raylib.ClearBackground(raylib.BLACK)
	raylib.EndDrawing()
    }

    raylib.CloseWindow()
}
