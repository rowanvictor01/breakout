package entities

import "vendor:raylib"


Ball :: struct
{
    using base: Entity,
    r: u16,
    vx: u16,
    vy: u16,
}


ball_create :: proc(base: Entity, radius: u16, vel_x: u16, vel_y: u16) -> Ball
{
    ball: Ball = {
	x = base.x,
	y = base.y,
	color = base.color,
	r = radius,
	vx = vel_x,
	vy = vel_y,
    }

    return ball
}

ball_draw :: proc(self: ^Ball)
{
    raylib.DrawCircle(i32(self.x), i32(self.y), f32(self.r), self.color)
}
