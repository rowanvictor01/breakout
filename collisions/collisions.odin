package collisions

import "vendor:raylib"
import "core:fmt"

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

get_ball_left :: proc(b: ^entities.Ball) -> f32 {return b.x - f32(b.r)}
get_ball_right :: proc(b: ^entities.Ball) -> f32 {return b.x + f32(b.r)}
get_ball_top :: proc(b: ^entities.Ball) -> f32 {return b.y - f32(b.r)}
get_ball_bottom :: proc(b: ^entities.Ball) -> f32 {return b.y + f32(b.r)}


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
    if get_ball_bottom(ball) >= BORDER_BOTTOM
    {
	ball.y = f32(BORDER_BOTTOM - ball.r)
	ball.vy = -ball.vy
    }
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
    //code
}
