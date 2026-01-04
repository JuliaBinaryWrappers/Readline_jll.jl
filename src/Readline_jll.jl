# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Readline_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Readline")
JLLWrappers.@generate_main_file("Readline", Base.UUID("05236dd9-4125-5232-aa7c-9ec0c9b2c25a"))
end  # module Readline_jll
