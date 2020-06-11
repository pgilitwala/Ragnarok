workspace "Ragnarok"
     architecture "x64"

     configurations
     {
      "Debug",
      "Release",
      "Dist"
     }

     outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

     -- include directories relative to root folder (solutions dir)
     IncludeDir = {}
     IncludeDir["GLFW"] = "Ragnarok/vendor/GLFW/include"
     IncludeDir["Glad"] = "Ragnarok/vendor/Glad/include"

     include "Ragnarok/vendor/GLFW"
     include "Ragnarok/vendor/Glad"

     project "Ragnarok"
         location "Ragnarok"
         kind "SharedLib"
         language "C++"

         targetdir ("bin/" .. outputdir .. "/%{prj.name}")
         objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

         pchheader "rgrpch.h"
         pchsource "Ragnarok/src/rgrpch.cpp"

         files
         {
          "%{prj.name}/src/**.h",
          "%{prj.name}/src/**.cpp"
         }

         includedirs
         {
          "%{prj.name}/vendor/spdlog/include",
          "%{prj.name}/src/",
          "%{IncludeDir.GLFW}",
          "%{IncludeDir.Glad}"
         }

         links
         {
            "GLFW",
            "Glad",
            "opengl32.lib"
		 }

         filter "system:windows"
              cppdialect "C++17"
              staticruntime "On"
              systemversion "latest"

              defines
              {
               "RGR_PLATFORM_WINDOWS",
               "RGR_BUILD_DLL",
               "GLFW_INCLUDE_NONE"
              }

              postbuildcommands
              {
               ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
              }

         filter "configurations:Debug"
              defines "RGR_DEBUG"
              buildoptions "/MDd"
              symbols "On"

         filter "configurations:Release"
              defines "RGR_RELEASE"
              buildoptions "/MD"
              optimize "On"

         filter "configurations:Dist"
              defines "RGR_DIST"
              buildoptions "/MD"
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
              buildoptions "/MDd"
              symbols "On"

         filter "configurations:Release"
              defines "RGR_RELEASE"
              buildoptions "/MD"
              optimize "On"

         filter "configurations:Dist"
              defines "RGR_DIST"
              buildoptions "/MDd"
              optimize "On"