#include <rgrpch.h>
#include "Application.h"
#include "Events/ApplicationEvent.h"
#include "Log.h"


namespace Ragnarok {

	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run() {
		WindowResizeEvent e(1280, 720);
		RGR_TRACE(e);
		while (true);
	}

}
