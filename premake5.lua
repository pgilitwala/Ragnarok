workspace "Ragnarok"
     architecture "x64"

     configurations
     {
      "Debug",
      "Release",
      "Dist"
     }

     outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

     project "Ragnarok"
         location "Ragnarok"
         kind "SharedLib"
         language "C++"

         targetdir ("bin/" .. outputdir .. "/%{prj.name}")
         objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

         files
         {
          "%{prj.name}/src/**.h",
          "%{prj.name}/src/**.cpp"
         }

         includedirs
         {
          "%{prj.name}/vendor/spdlog/include"
         }

         filter "system:windows"
              cppdialect "C++17"
              staticruntime "On"
              systemversion "latest"

              defines
              {
               "RGR_PLATFORM_WINDOWS",
               "RGR_BUILD_DLL"
              }

              postbuildcommands
              {
               ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
              }

         filter "configurations:Debug"
              defines "RGR_DEBUG"
              symbols "On"

         filter "configurations:Release"
              defines "RGR_RELEASE"
              optimize "On"

         filter "configurations:Dist"
              defines "RGR_DIST"
              optimize "On"

    project "Sandbox"
         location "Sandbox"
         kind "ConsoleApp"
         language "C++"

         targetdir ("bin/" .. outputdir .. "/%{prj.name}")
         objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

         files
         {
          "%{prj.name}/src/**.h",
          "%{prj.name}/src/**.cpp"
         }

         includedirs
         {
          "Ragnarok/vendor/spdlog/include",
          "Ragnarok/src"
         }

         links
         {
          "Ragnarok"
         }

         filter "system:windows"
              cppdialect "C++17"
              staticruntime "On"
              systemversion "latest"

              defines
              {
               "RGR_PLATFORM_WINDOWS"
              }

         filter "configurations:Debug"
              defines "RGR_DEBUG"
              symbols "On"

         filter "configurations:Release"
              defines "RGR_RELEASE"
              optimize "On"

         filter "configurations:Dist"
              defines "RGR_DIST"
              optimize "On"