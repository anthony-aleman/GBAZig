const std = @import("std");
const GBABuilder = @import("GBA/builder.zig");

pub fn build(b: *std.Build) void {
    const exe = GBABuilder.addGBAExecutable(b, "HELLOWORLD", "src/main.zig");
    const install_docs = b.addInstallDirectory(.{
        .source_dir = exe.getEmittedDocs(),
        .install_dir = .prefix,
        .install_subdir = "docs",
    });

    const docs_step = b.step("docs", "Copy documentation articfacts to prefix path");
    docs_step.dependOn(&install_docs.step);
    // Mode 4 Flip
    //const mode4flip = GBABuilder.addGBAExecutable(b, "mode4flip", "examples/mode4flip/mode4flip.zig");
    //GBABuilder.convertMode4Images(mode4flip, &[_]GBABuilder.ImageSourceTarget{
    //    .{
    //        .source = "examples/mode4flip/front.bmp",
    //        .target = "examples/mode4flip/front.agi",
    //    },
    //    .{
    //        .source = "examples/mode4flip/back.bmp",
    //        .target = "examples/mode4flip/back.agi",
    //    },
    //}, "examples/mode4flip/mode4flip.agp");

    // Key demo, TODO: Use image created by the build system once we support indexed image
    //const keydemo = GBABuilder.addGBAExecutable(b, "keydemo", "examples/keydemo/keydemo.zig");
    //keydemo.addCSourceFile(.{
    //    .file = .{ .path = "examples/keydemo/gba_pic.c" },
    //    .flags = &[_][]const u8{"-std=c99"},
    //});

    // Simple OBJ demo, TODO: Use tile and palette data created by the build system
    //const objDemo = GBABuilder.addGBAExecutable(b, "objDemo", "examples/objDemo/objDemo.zig");
    //objDemo.addCSourceFile(.{
    //    .file = .{ .path = "examples/objDemo/metroid_sprite_data.c" },
    //    .flags = &[_][]const u8{"-std=c99"},
    //});

    // tileDemo, TODO: Use tileset, tile and palette created by the build system
    //const tileDemo = GBABuilder.addGBAExecutable(b, "tileDemo", "examples/tileDemo/tileDemo.zig");
    //tileDemo.addCSourceFile(.{
    //    .file = .{ .path = "examples/tileDemo/brin.c" },
    //    .flags = &[_][]const u8{"-std=c99"},
    //});

    // screenBlock
    //_ = GBABuilder.addGBAExecutable(b, "screenBlock", "examples/screenBlock/screenBlock.zig");

    // charBlock
    //const charBlock = GBABuilder.addGBAExecutable(b, "charBlock", "examples/charBlock/charBlock.zig");
    //charBlock.addCSourceFile(.{
    //    .file = .{ .path = "examples/charBlock/cbb_ids.c" },
    //    .flags = &[_][]const u8{"-std=c99"},
    //});

    // objAffine
    //const objAffine = GBABuilder.addGBAExecutable(b, "objAffine", "examples/objAffine/objAffine.zig");
    //objAffine.addCSourceFile(.{
    //    .file = .{ .path = "examples/objAffine/metr.c" },
    //    .flags = &[_][]const u8{"-std=c99"},
    //});
}
