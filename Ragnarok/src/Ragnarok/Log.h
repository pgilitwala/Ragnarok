#pragma once
#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Ragnarok {
	class RAGNAROK_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger;  }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};

}


// Core log macros
#define RGR_CORE_TRACE(...)    ::Ragnarok::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define RGR_CORE_INFO(...)     ::Ragnarok::Log::GetCoreLogger()->info(__VA_ARGS__)
#define RGR_CORE_WARN(...)     ::Ragnarok::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define RGR_CORE_ERROR(...)    ::Ragnarok::Log::GetCoreLogger()->error(__VA_ARGS__)
#define RGR_CORE_FATAL(...)    ::Ragnarok::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define RGR_TRACE(...)         ::Ragnarok::Log::GetClientLogger()->trace(__VA_ARGS__)
#define RGR_INFO(...)          ::Ragnarok::Log::GetClientLogger()->info(__VA_ARGS__)
#define RGR_WARN(...)          ::Ragnarok::Log::GetClientLogger()->warn(__VA_ARGS__)
#define RGR_ERROR(...)         ::Ragnarok::Log::GetClientLogger()->error(__VA_ARGS__)
#define RGR_FATAL(...)         ::Ragnarok::Log::GetClientLogger()->fatal(__VA_ARGS__)

