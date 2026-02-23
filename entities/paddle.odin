package entities

import "vendor:raylib"


Paddle :: struct
{
    using base: Entity,
    vx: f32,
}


paddle_create :: proc(base: Entity, vel_x: f32) -> Paddle
{
    paddle: Paddle = {
	x = base.x,
	y = base.y,
	width = base.width,
	height = base.height,
	color = base.color,
	vx = vel_x,
    }
    
    return paddle
}

paddle_update :: proc(self: ^Paddle)
{
    // Detect input and update state
    if raylib.IsKeyDown(raylib.KeyboardKey.A)
    {
	self.x = self.x - self.vx * raylib.GetFrameTime()
    }
    if raylib.IsKeyDown(raylib.KeyboardKey.D)
    {
	self.x = self.x + self.vx * raylib.GetFrameTime()
    }
}

paddle_draw :: proc(self: ^Paddle)
{
    raylib.DrawRectangle(i32(self.x), i32(self.y), i32(self.width), i32(self.height), self.color)
}

paddle_get_bounds :: proc(self: ^Paddle) -> raylib.Rectangle
{
    bounds: raylib.Rectangle =
    {
	x = f32(self.x),
	y = f32(self.y),
	width = f32(self.width),
	height = f32(self.height),
    }

    return bounds
}
