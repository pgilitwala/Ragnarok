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

#ifdef RGR_ENABLE_ASSERTS
	#define RGR_ASSERT(x, ...) { if(!(x)) { RGR_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
	#define RGR_CORE_ASSERT(x, ...) { if(!(x)) { RGR_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak();}}
#else
	#define RGR_ASSERT(x, ...)
	#define RGR_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)
