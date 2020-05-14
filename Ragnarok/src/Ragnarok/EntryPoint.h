#pragma once

#ifdef RGR_PLATFORM_WINDOWS

extern Ragnarok::Application* Ragnarok::CreateApplication();

int main() {
	Ragnarok::Log::Init();
	RGR_CORE_WARN("Initialized Core Log");
	RGR_INFO("Initialized Client Log");

	auto app = Ragnarok::CreateApplication();
	app->Run();
	delete app;
}

#endif // RGR_PLATFORM_WINDOWS
