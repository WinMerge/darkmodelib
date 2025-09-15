/////////////////////////////////////////////////////////////////////////////
//    Dark mode for WinMerge
//    Copyright (C) 2025 ozone10
//    SPDX-License-Identifier: MPL-2.0
/////////////////////////////////////////////////////////////////////////////
/**
 * @file  MergeDarkMode.h
 *
 * @brief Declaration file for Dark mode for WinMerge
 *
 */

#pragma once

#include "DarkModeSubclass.h"

inline constexpr DWORD CC_FLAGS_DARK = CC_RGBINIT | CC_FULLOPEN | CC_ENABLEHOOK;

namespace ATL
{
	class CImage; // from atlimage.h
};

/**
 * @brief Helper class for dark mode for WinMerge
 */
namespace WinMergeDarkMode
{
	/**
	 * @brief Invert bitmap image colors.
	 * @param [in] image Image to invert colors.
	 */
	DARKMODE_API void InvertLightness(ATL::CImage& image);

	/**
	 * @brief Set sublass procedure for ascii art in About dialog.
	 * @param [in] hWnd About dialog handle.
	 */
	DARKMODE_API void SetAsciiArtSubclass(HWND hWnd);
}

