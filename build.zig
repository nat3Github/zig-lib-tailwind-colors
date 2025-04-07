const std = @import("std");
pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const step_test = b.step("test", "Run All Tests in src/test");

    const tailwind_module = b.addModule("tailwind", .{
        .optimize = optimize,
        .target = target,
        .root_source_file = b.path("src/root.zig"),
    });

    const lib_test = b.addTest(.{
        .target = target,
        .optimize = optimize,
        .root_module = tailwind_module,
    });
    const lib_test_run = b.addRunArtifact(lib_test);
    step_test.dependOn(&lib_test_run.step);
}
