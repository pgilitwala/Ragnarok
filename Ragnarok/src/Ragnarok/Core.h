#pragma once

#ifdef RGR_PLATFORM_WINDOWS
	#ifdef RGR_BUILD_DLL
		#define RAGNAROK_API __declspec(dllexport)
	#else
		#define RAGNAROK_API __declspec(dllimport)
	#endif // RGR_BUILD_DLL
#else
	#error RAGNAROK only supports windows
#endif