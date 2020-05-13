#pragma once

#ifdef RGR_PLATFORM_WINDOWS

extern Ragnarok::Application* Ragnarok::CreateApplication();

int main() {
	auto app = Ragnarok::CreateApplication();
	app->Run();
	delete app;
}

#endif // RGR_PLATFORM_WINDOWS
