## It seems I need to write this file myself
## The code is mainly inspired by
##   - Source of BinDeps.jl
##   - https://github.com/JuliaOpt/NLopt.jl/blob/master/src/NLopt.jl
##

# if Base.OS_NAME != :Linux
#     error("currently, this library only supports Linux")
# end


# get the current path
currentFilePath = @__FILE__()
currentDirPath = dirname(currentFilePath)

# function to mkdir lib dir
function mklibdir()
    usrdir = joinpath(currentDirPath, "usr");
    
    if isdir(usrdir) == false
        mkdir(usrdir);
    end

    libdir = joinpath(usrdir, "lib");
    if isdir(libdir) == false
        mkdir(libdir);
    end
end

# run make file
function runmake()
    usrdir = joinpath(currentDirPath, "usr", "lib");
    run(`make `)
end

# write the "deps.jl" file
function writeDeps()
    libpath = joinpath(currentDirPath, "liblmbm.so")
    outputfile = open(joinpath(currentDirPath, "deps.jl"), "w");
    write( outputfile, "macro checked_lib(libname, path)\n    (Libdl.dlopen_e(path) == C_NULL) && error(\"Unable to load \\n\\n\$libname (\$path)\n\nPlease re-run Pkg.build(package), and restart Julia.\")\n    quote const \$(esc(libname)) = \$path end\nend\n@checked_lib liblmbm \"$(libpath)\"\n")
    close(outputfile)
end

runmake()
writeDeps()