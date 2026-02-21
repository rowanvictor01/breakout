package entities

import "vendor:raylib"


Entity :: struct
{
    x: f32,
    y: f32,
    width: u16,
    height: u16,
    color: raylib.Color,
}
