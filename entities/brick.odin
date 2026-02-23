package entities

import "vendor:raylib"
import "core:fmt"


Brick :: struct
{
    using base: Entity,
    is_active: bool,
}


calc_brick_coords :: proc(current_row: int, current_col: int, canvas_width: i32, brick_width: int, brick_height: int, cols: int, padding: int) -> (f32, f32)
{
    total_bricks_width := (cols * brick_width) + ((cols - 1) * padding)
    offset_x := (int(canvas_width) - total_bricks_width) / 2
    offset_y := 35
    
    x: f32 = f32(offset_x + (current_col * (brick_width + padding)))
    y: f32 = f32(offset_y + (current_row * (brick_height + padding)))
    
    return x, y
}


bricks_create :: proc() -> [8][14]Brick
{
    // Brick Dimension Constants
    B_WIDTH :: 52
    B_HEIGHT :: 20
    YELLOW :: raylib.YELLOW
    GREEN :: raylib.GREEN
    ORANGE :: raylib.ORANGE
    RED :: raylib.RED
    
    PADDING :: 14
    ROWS :: 8
    COLS :: 14
    
    // Bricks Storage
    bricks: [ROWS][COLS]Brick
    
    for row in 0 ..< int(len(bricks))
    {
	for col in 0 ..< int(len(bricks[0]))
	{
	    brick: Brick = {
		width = B_WIDTH,
		height = B_HEIGHT,
		is_active = true,
	    }

	    switch row
	    {
		case 0:
		    fallthrough
		case 1:
		    brick.x, brick.y = calc_brick_coords(row, col, raylib.GetScreenWidth(), B_WIDTH, B_HEIGHT, COLS, PADDING)
		    brick.color = RED
		case 2:
		    fallthrough
		case 3:
		    brick.x, brick.y = calc_brick_coords(row, col, raylib.GetScreenWidth(), B_WIDTH, B_HEIGHT, COLS, PADDING)
		    brick.color = ORANGE
		case 4:
		    fallthrough
		case 5:
		    brick.x, brick.y = calc_brick_coords(row, col, raylib.GetScreenWidth(), B_WIDTH, B_HEIGHT, COLS, PADDING)
		    brick.color = GREEN
		case 6:
		    fallthrough
		case 7:
		    brick.x, brick.y = calc_brick_coords(row, col, raylib.GetScreenWidth(), B_WIDTH, B_HEIGHT, COLS, PADDING)
		    brick.color = YELLOW
	    }

	    bricks[row][col] = brick
	}
    }
    
    return bricks
}

bricks_draw :: proc(bricks: ^[8][14]Brick)
{
    for o in 0 ..< int(len(bricks))
    {
	for i in 0 ..< int(len(bricks[0]))
	{
	    raylib.DrawRectangle(i32(bricks[o][i].x),
				 i32(bricks[o][i].y),
				 i32(bricks[o][i].width),
				 i32(bricks[o][i].height),
				 bricks[o][i].color)
	}
    }
}

bricks_get_bounds :: proc(bricks: ^[8][14]Brick) -> [8][14]raylib.Rectangle
{
    bricks_bounds: [8][14]raylib.Rectangle
    
    for o in 0 ..< len(bricks)
    {
	for i in 0 ..< len(bricks[0])
	{
	    bounds: raylib.Rectangle =
	    {
		x = f32(bricks[o][i].x),
		y = f32(bricks[o][i].y),
		width = f32(bricks[o][i].width),
		height = f32(bricks[o][i].height),
	    }
	    bricks_bounds[o][i] = bounds
	}
    }
    return bricks_bounds
}
