#include <Ragnarok.h>

class Sandbox : public Ragnarok::Application {
public:
	Sandbox() {

	}

	~Sandbox() {

	}
};

Ragnarok::Application* Ragnarok::CreateApplication() {
	return new Sandbox();
}
