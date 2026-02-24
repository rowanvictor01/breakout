package collisions

import "vendor:raylib"
import "core:math"
import "../entities"


calc_paddle_bounce :: proc(paddle: ^entities.Paddle, ball: ^entities.Ball) -> (f32, f32)
{
    // Calc where the ball hit relative to the center of the paddle
    intersection_offset := ball.x - get_paddle_center_x(paddle)
    
    // Normalize the offset into a range between -1.0 to 1.0
    normalized_hit := intersection_offset  / (f32(paddle.width / 2))
    
    // Map to an angle
    DEGREES :: 75
    max_bounce_angle_in_radians: f32 = DEGREES * (math.PI / 180)
    new_angle := normalized_hit * max_bounce_angle_in_radians
    
    // Convert angle back to velocity values
    TARGET_SPEED :: 550
    
    new_vel_x: f32 = TARGET_SPEED * math.sin_f32(new_angle)
    new_vel_y: f32 = -TARGET_SPEED * math.cos_f32(new_angle)
    
    return new_vel_x, new_vel_y
}
