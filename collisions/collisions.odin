package collisions

import "vendor:raylib"

import "../entities"
import "../init"


BORDER_LEFT :: 0
BORDER_RIGHT :: init.WIN_WIDTH
BORDER_TOP :: 0
BORDER_BOTTOM :: init.WIN_HEIGHT


get_paddle_left :: proc(p: ^entities.Paddle) -> f32 {return p.x}
get_paddle_right :: proc(p: ^entities.Paddle) -> f32 {return p.x + f32(p.width)}
get_paddle_top :: proc(p: ^entities.Paddle) -> f32 {return p.y}
get_paddle_bottom :: proc(p: ^entities.Paddle) -> f32 {return p.y + f32(p.height)}
get_paddle_center_x :: proc(p: ^entities.Paddle) -> f32 {return p.x + f32(p.width / 2)}

get_ball_left :: proc(b: ^entities.Ball) -> f32 {return b.x - f32(b.r)}
get_ball_right :: proc(b: ^entities.Ball) -> f32 {return b.x + f32(b.r)}
get_ball_top :: proc(b: ^entities.Ball) -> f32 {return b.y - f32(b.r)}
get_ball_bottom :: proc(b: ^entities.Ball) -> f32 {return b.y + f32(b.r)}
get_ball_center :: proc(b: ^entities.Ball) -> raylib.Vector2 {center: raylib.Vector2; center[0] = b.x; center[1] = b.y; return center}

get_brick_left :: proc(b: entities.Brick) -> f32 {return b.x}
get_brick_right :: proc(b: entities.Brick) -> f32 {return b.x + f32(b.width)}
get_brick_top :: proc(b: entities.Brick) -> f32 {return b.y}
get_brick_bottom :: proc(b: entities.Brick) -> f32 {return b.y + f32(b.height)}


collision_paddle_border :: proc(paddle: ^entities.Paddle)
{
    if get_paddle_left(paddle) <= BORDER_LEFT {paddle.x = BORDER_LEFT}
    if get_paddle_right(paddle) >= BORDER_RIGHT {paddle.x = BORDER_RIGHT - f32(paddle.width)}
}

collision_ball_border :: proc(ball: ^entities.Ball)
{
    if get_ball_top(ball) <= BORDER_TOP
    {
	// Correct ball pos
	ball.y = f32(BORDER_TOP + ball.r)

	// bounce
	ball.vy = -ball.vy
    }
    // if get_ball_bottom(ball) >= BORDER_BOTTOM
    // {
    // 	ball.y = f32(BORDER_BOTTOM - ball.r)
    // 	ball.vy = -ball.vy
    // }
    if get_ball_left(ball) <= BORDER_LEFT
    {
	ball.x = f32(BORDER_LEFT + ball.r)
	ball.vx = -ball.vx
    }
    if get_ball_right(ball) >= BORDER_RIGHT
    {
	ball.x = f32(BORDER_RIGHT - ball.r)
	ball.vx = -ball.vx
    }
}

collision_paddle_ball :: proc(paddle: ^entities.Paddle, ball: ^entities.Ball)
{
    if raylib.CheckCollisionCircleRec(get_ball_center(ball), f32(ball.r), entities.paddle_get_bounds(paddle))
    {
	ball.y = get_paddle_top(paddle) - f32(ball.r)  // [FIX]: Detect first from which side ball hit paddle before correcting
	ball.vx, ball.vy = calc_paddle_bounce(paddle, ball)
    }
}

collision_bricks_ball :: proc(bricks: ^[8][14]entities.Brick, ball: ^entities.Ball)
{
    bricks_bounds := entities.bricks_get_bounds(bricks)

    for o in 0 ..< len(bricks)
    {
	for i in 0 ..< len(bricks[0])
	{
	    if raylib.CheckCollisionCircleRec(get_ball_center(ball), f32(ball.r), bricks_bounds[o][i]) && bricks[o][i].is_active
	    {
		bricks[o][i].is_active = false
	     	ball.y = get_brick_bottom(bricks[o][i]) + f32(ball.r)
	    	ball.vy = -ball.vy
	    }
	}
    }
}
