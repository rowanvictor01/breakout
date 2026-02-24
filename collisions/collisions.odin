package collisions

import "vendor:raylib"
import "core:fmt"

import "../entities"
import "../init"


BORDER_LEFT :: 0
BORDER_RIGHT :: init.WIN_WIDTH
BORDER_TOP :: 0
BORDER_BOTTOM :: init.WIN_HEIGHT


collision_paddle_border :: proc(paddle: ^entities.Paddle)
{
    // Paddle Sides
    paddle_left := paddle.x
    paddle_right := paddle.x + f32(paddle.width)
    paddle_top := paddle.y
    paddle_bottom := paddle.y + f32(paddle.height)
    
    if paddle_left <= BORDER_LEFT {paddle.x = BORDER_LEFT}
    if paddle_right >= BORDER_RIGHT {paddle.x = BORDER_RIGHT - f32(paddle.width)}
}

collision_ball_border :: proc(ball: ^entities.Ball)
{
    // Ball Bounds
    ball_left := ball.x - f32(ball.r)
    ball_right := ball.x + f32(ball.r)
    ball_top := ball.y - f32(ball.r)
    ball_bottom := ball.y + f32(ball.r)
    
    if ball_top <= BORDER_TOP
    {
	// Correct ball pos
	ball.y = f32(BORDER_TOP + ball.r)

	// bounce
	ball.vy = -ball.vy
    }
    if ball_bottom >= BORDER_BOTTOM
    {
	ball.y = f32(BORDER_BOTTOM - ball.r)
	ball.vy = -ball.vy
    }
    if ball_left <= BORDER_LEFT
    {
	ball.x = f32(BORDER_LEFT + ball.r)
	ball.vx = -ball.vx
    }
    if ball_right >= BORDER_RIGHT
    {
	ball.x = f32(BORDER_RIGHT - ball.r)
	ball.vx = -ball.vx
    }
}
