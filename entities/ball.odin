package entities

import "vendor:raylib"


Ball :: struct
{
    using base: Entity,
    r: u16,
    vx: f32,
    vy: f32,
    is_active: bool,
}


ball_create :: proc(base: Entity, radius: u16, vel: f32) -> Ball
{
    ball: Ball = {
	x = base.x,
	y = base.y,
	color = base.color,
	r = radius,
	vx = 0,
	vy = vel,
	is_active = false,
    }

    return ball
}

ball_update :: proc(self: ^Ball)
{
    self.y = self.y - self.vy * raylib.GetFrameTime()
}

ball_draw :: proc(self: ^Ball)
{
    raylib.DrawCircle(i32(self.x), i32(self.y), f32(self.r), self.color)
}
