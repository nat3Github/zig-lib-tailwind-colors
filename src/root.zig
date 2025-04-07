/// rgb colors from tailwind css version 4
const std = @import("std");
/// small rgba struct for convenience
pub const RgbaColor = @This();

/// accepts "FF00FF" or "#FF00FF" or "#ff00ff"
pub fn from_hex(comptime hex: []const u8) RgbaColor {
    const rgba = comptime hex2rgb(hex) catch {
        @compileError("failed to convert rgba from hex code");
    };
    return RgbaColor{ .rgba = rgba };
}
pub fn convert_hex(hex: []const u8) !RgbaColor {
    const rgba = try hex2rgb(hex);
    return RgbaColor{ .rgba = rgba };
}
fn hex2rgb(hex: []const u8) ![4]u8 {
    if (hex.len == 0) return error.HexStringIsEmpty;
    if (hex.len > 7) return error.HexStringTooLong;
    if (hex[0] == '#') return hex2rgb(hex[1..]);
    if (hex.len != 6) return error.HexColorCodeWrongLen;
    var rgba: [4]u8 = undefined;
    for (rgba[0..3], 0..) |_, i| {
        const start = i * 2;
        const slice = hex[start .. start + 2];
        const value = try std.fmt.parseInt(u8, slice, 16);
        rgba[i] = value;
    }
    rgba[3] = 255;
    return rgba;
}

/// for easy tuple destructuring
pub fn rgb(self: *const RgbaColor) struct { u8, u8, u8 } {
    const arr = self.rgba;
    return .{ arr[0], arr[1], arr[2] };
}
/// color equality checking
pub fn eql(self: *const RgbaColor, other: RgbaColor) bool {
    return std.mem.eql(u8, &self.rgba, &other.rgba);
}
rgba: [4]u8 = std.mem.zeroes([4]u8),

/// tailwind v4 color hex codes:
pub const black = "#000000";
pub const white = "#ffffff";

pub const amber50 = "#fffbeb";
pub const amber100 = "#fef3c7";
pub const amber200 = "#fde68a";
pub const amber300 = "#fcd34d";
pub const amber400 = "#fbbf24";
pub const amber500 = "#f59e0b";
pub const amber600 = "#d97706";
pub const amber700 = "#b45309";
pub const amber800 = "#92400e";
pub const amber900 = "#78350f";
pub const amber950 = "#451a03";

pub const blue50 = "#eff6ff";
pub const blue100 = "#dbeafe";
pub const blue200 = "#bfdbfe";
pub const blue300 = "#93c5fd";
pub const blue400 = "#60a5fa";
pub const blue500 = "#3b82f6";
pub const blue600 = "#2563eb";
pub const blue700 = "#1d4ed8";
pub const blue800 = "#1e40af";
pub const blue900 = "#1e3a8a";
pub const blue950 = "#172554";

pub const cyan50 = "#ecfeff";
pub const cyan100 = "#cffafe";
pub const cyan200 = "#a5f3fc";
pub const cyan300 = "#67e8f9";
pub const cyan400 = "#22d3ee";
pub const cyan500 = "#06b6d4";
pub const cyan600 = "#0891b2";
pub const cyan700 = "#0e7490";
pub const cyan800 = "#155e75";
pub const cyan900 = "#164e63";
pub const cyan950 = "#083344";

pub const emerald100 = "#d1fae5";
pub const emerald200 = "#a7f3d0";
pub const emerald300 = "#6ee7b7";
pub const emerald400 = "#34d399";
pub const emerald500 = "#10b981";
pub const emerald600 = "#059669";
pub const emerald700 = "#047857";
pub const emerald800 = "#065f46";
pub const emerald900 = "#064e3b";
pub const emerald950 = "#022c22";

pub const fuchsia50 = "#fdf4ff";
pub const fuchsia100 = "#fae8ff";
pub const fuchsia200 = "#f5d0fe";
pub const fuchsia300 = "#f0abfc";
pub const fuchsia400 = "#e879f9";
pub const fuchsia500 = "#d946ef";
pub const fuchsia600 = "#c026d3";
pub const fuchsia700 = "#a21caf";
pub const fuchsia800 = "#86198f";
pub const fuchsia900 = "#701a75";
pub const fuchsia950 = "#4a044e";

pub const gray50 = "#f9fafb";
pub const gray100 = "#f3f4f6";
pub const gray200 = "#e5e7eb";
pub const gray300 = "#d1d5db";
pub const gray400 = "#9ca3af";
pub const gray500 = "#6b7280";
pub const gray600 = "#4b5563";
pub const gray700 = "#374151";
pub const gray800 = "#1f2937";
pub const gray900 = "#111827";
pub const gray950 = "#030712";

pub const green50 = "#f0fdf4";
pub const green100 = "#dcfce7";
pub const green200 = "#bbf7d0";
pub const green300 = "#86efac";
pub const green400 = "#4ade80";
pub const green500 = "#22c55e";
pub const green600 = "#16a34a";
pub const green700 = "#15803d";
pub const green800 = "#166534";
pub const green900 = "#14532d";
pub const green950 = "#052e16";

pub const indigo50 = "#eef2ff";
pub const indigo100 = "#e0e7ff";
pub const indigo200 = "#c7d2fe";
pub const indigo300 = "#a5b4fc";
pub const indigo400 = "#818cf8";
pub const indigo500 = "#6366f1";
pub const indigo600 = "#4f46e5";
pub const indigo700 = "#4338ca";
pub const indigo800 = "#3730a3";
pub const indigo900 = "#312e81";
pub const indigo950 = "#1e1b4b";

pub const lime50 = "#f7fee7";
pub const lime100 = "#ecfccb";
pub const lime200 = "#d9f99d";
pub const lime300 = "#bef264";
pub const lime400 = "#a3e635";
pub const lime500 = "#84cc16";
pub const lime600 = "#65a30d";
pub const lime700 = "#4d7c0f";
pub const lime800 = "#3f6212";
pub const lime900 = "#365314";
pub const lime950 = "#1a2e05";

pub const neutral50 = "#fafafa";
pub const neutral100 = "#f5f5f5";
pub const neutral200 = "#e5e5e5";
pub const neutral300 = "#d4d4d4";
pub const neutral400 = "#a3a3a3";
pub const neutral500 = "#737373";
pub const neutral600 = "#525252";
pub const neutral700 = "#404040";
pub const neutral800 = "#262626";
pub const neutral900 = "#171717";
pub const neutral950 = "#0a0a0a";

pub const orange50 = "#fff7ed";
pub const orange100 = "#ffedd5";
pub const orange200 = "#fed7aa";
pub const orange300 = "#fdba74";
pub const orange400 = "#fb923c";
pub const orange500 = "#f97316";
pub const orange600 = "#ea580c";
pub const orange700 = "#c2410c";
pub const orange800 = "#9a3412";
pub const orange900 = "#7c2d12";
pub const orange950 = "#431407";

pub const pink50 = "#fdf2f8";
pub const pink100 = "#fce7f3";
pub const pink200 = "#fbcfe8";
pub const pink300 = "#f9a8d4";
pub const pink400 = "#f472b6";
pub const pink500 = "#ec4899";
pub const pink600 = "#db2777";
pub const pink700 = "#be185d";
pub const pink800 = "#9d174d";
pub const pink900 = "#831843";
pub const pink950 = "#500724";

pub const purple50 = "#faf5ff";
pub const purple100 = "#f3e8ff";
pub const purple200 = "#e9d5ff";
pub const purple300 = "#d8b4fe";
pub const purple400 = "#c084fc";
pub const purple500 = "#a855f7";
pub const purple600 = "#9333ea";
pub const purple700 = "#7e22ce";
pub const purple800 = "#6b21a8";
pub const purple950 = "#3b0764";

pub const red50 = "#fef2f2";
pub const red100 = "#fee2e2";
pub const red200 = "#fecaca";
pub const red300 = "#fca5a5";
pub const red400 = "#f87171";
pub const red500 = "#ef4444";
pub const red600 = "#dc2626";
pub const red700 = "#b91c1c";
pub const red800 = "#991b1b";
pub const red900 = "#7f1d1d";
pub const red950 = "#450a0a";

pub const rose50 = "#fff1f2";
pub const rose100 = "#ffe4e6";
pub const rose200 = "#fecdd3";
pub const rose300 = "#fda4af";
pub const rose400 = "#fb7185";
pub const rose500 = "#f43f5e";
pub const rose600 = "#e11d48";
pub const rose700 = "#be123c";
pub const rose800 = "#9f1239";
pub const rose900 = "#881337";
pub const rose950 = "#4c0519";

pub const sky50 = "#f0f9ff";
pub const sky100 = "#e0f2fe";
pub const sky200 = "#bae6fd";
pub const sky300 = "#7dd3fc";
pub const sky400 = "#38bdf8";
pub const sky500 = "#0ea5e9";
pub const sky600 = "#0284c7";
pub const sky700 = "#0369a1";
pub const sky800 = "#075985";
pub const sky900 = "#0c4a6e";
pub const sky950 = "#082f49";

pub const slate50 = "#f8fafc";
pub const slate100 = "#f1f5f9";
pub const slate200 = "#e2e8f0";
pub const slate300 = "#cbd5e1";
pub const slate400 = "#94a3b8";
pub const slate500 = "#64748b";
pub const slate600 = "#475569";
pub const slate700 = "#334155";
pub const slate800 = "#1e293b";
pub const slate900 = "#0f172a";
pub const slate950 = "#020617";

pub const stone50 = "#fafaf9";
pub const stone100 = "#f5f5f4";
pub const stone200 = "#e7e5e4";
pub const stone300 = "#d6d3d1";
pub const stone400 = "#a8a29e";
pub const stone500 = "#78716c";
pub const stone600 = "#57534e";
pub const stone700 = "#44403c";
pub const stone800 = "#292524";
pub const stone900 = "#1c1917";
pub const stone950 = "#0c0a09";

pub const teal50 = "#f0fdfa";
pub const teal100 = "#ccfbf1";
pub const teal200 = "#99f6e4";
pub const teal300 = "#5eead4";
pub const teal400 = "#2dd4bf";
pub const teal500 = "#14b8a6";
pub const teal600 = "#0d9488";
pub const teal700 = "#0f766e";
pub const teal800 = "#115e59";
pub const teal900 = "#134e4a";
pub const teal950 = "#042f2e";

pub const violet50 = "#f5f3ff";
pub const violet100 = "#ede9fe";
pub const violet200 = "#ddd6fe";
pub const violet300 = "#c4b5fd";
pub const violet400 = "#a78bfa";
pub const violet500 = "#8b5cf6";
pub const violet600 = "#7c3aed";
pub const violet700 = "#6d28d9";
pub const violet800 = "#5b21b6";
pub const violet900 = "#4c1d95";
pub const violet950 = "#2e1065";

pub const yellow50 = "#fefce8";
pub const yellow100 = "#fef9c3";
pub const yellow200 = "#fef08a";
pub const yellow300 = "#fde047";
pub const yellow400 = "#facc15";
pub const yellow500 = "#eab308";
pub const yellow600 = "#ca8a04";
pub const yellow700 = "#a16207";
pub const yellow800 = "#854d0e";
pub const yellow900 = "#713f12";
pub const yellow950 = "#422006";

pub const zinc50 = "#fafafa";
pub const zinc100 = "#f4f4f5";
pub const zinc200 = "#e4e4e7";
pub const zinc300 = "#d4d4d8";
pub const zinc400 = "#a1a1aa";
pub const zinc500 = "#71717a";
pub const zinc600 = "#52525b";
pub const zinc700 = "#3f3f46";
pub const zinc800 = "#27272a";
pub const zinc900 = "#18181b";
pub const zinc950 = "#09090b";

//            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//                    Version 2, December 2004
// Copyright (C) nat3 <https://github.com/nat3Github>
// Everyone is permitted to copy and distribute verbatim or modified
// copies of this license document, and changing it is allowed as long
// as the name is changed.
//            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//  0. You just DO WHAT THE FUCK YOU WANT TO.

// MIT License
// Copyright (c) Tailwind Labs, Inc.
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
