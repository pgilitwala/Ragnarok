#pragma once

#include "Core.h"

namespace Ragnarok {
	class RAGNAROK_API Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	};

	// To be defined in client
	Application* CreateApplication();
}


