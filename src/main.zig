const std = @import("std");
const GBA = @import("gba").GBA;
const Mode3 = @import("gba").Mode3;
const LCD = @import("gba").LCD;

export var gameHeader linksection(".gbaheader") = GBA.Header.setup("HELLOWORLD", "AFSE", "00", 0);

fn draw_green() !void {
    Mode3.line(5, 101, 200, 101, GBA.toNativeColor(0, 30, 0));
    Mode3.line(201, 101, 201, 75, GBA.toNativeColor(0, 30, 0));
    Mode3.line(6, 101, 71, 74, GBA.toNativeColor(0, 30, 0));
    Mode3.line(70, 74, 200, 74, GBA.toNativeColor(0, 30, 0));
}

fn draw_white() !void {
    Mode3.line(70, 45, 200, 45, GBA.toNativeColor(30, 30, 30));
    Mode3.line(70, 73, 200, 73, GBA.toNativeColor(30, 30, 30));
    Mode3.line(201, 45, 201, 73, GBA.toNativeColor(30, 30, 30));
    Mode3.line(71, 45, 102, 59, GBA.toNativeColor(30, 30, 30));
    Mode3.line(71, 73, 102, 59, GBA.toNativeColor(30, 30, 30));
}

fn draw_blk() !void {
    Mode3.line(4, 15, 200, 15, GBA.toNativeColor(1, 1, 1));
    Mode3.line(201, 15, 201, 45, GBA.toNativeColor(1, 2, 2));
}

fn draw_red() !void {
    Mode3.line(5, 15, 100, 60, 15);
    Mode3.line(5, 16, 5, 100, 15);
    Mode3.line(5, 100, 100, 60, 15);
}

fn draw_shapes() void {
    //Red Triangle
    try draw_red();
    //Black
    try draw_blk();
    //White
    try draw_white();

    //green
    try draw_green();
}

pub fn main() !void {
    LCD.setupDisplayControl(.{
        .mode = .Mode3,
        .backgroundLayer2 = .Show,
    });

    draw_shapes();

    while (true) {}
}
