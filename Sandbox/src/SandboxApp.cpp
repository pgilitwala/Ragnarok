#include <Ragnarok.h>


class ExampleLayer : public Ragnarok::Layer {
public:
	ExampleLayer()
		: Layer("Example") {

	}

	void OnUpdate() override {
		RGR_INFO("ExampleLayer::Update");
	}

	void OnEvent(Ragnarok::Event& event) override {
		RGR_TRACE("{0}", event);
	}
};


class Sandbox : public Ragnarok::Application {
public:
	Sandbox() {
		PushLayer(new ExampleLayer());
	}

	~Sandbox() {

	}
};

Ragnarok::Application* Ragnarok::CreateApplication() {
	return new Sandbox();
}
