# Rubiks004b.jl  Wulf Luck   2023 09 14  2023 09 11

Rubiks = Array{String}(undef,6,3,3)

# colors 
# red "R"       green "G"   blue "B"
# yellow "Y"    orange "O"  white "W" 

# initial faces
# front face 1
Rubiks[1,1,1]="B"; Rubiks[1,2,1]="O"; Rubiks[1,3,1]="Y"
Rubiks[1,1,2]="B"; Rubiks[1,2,2]="R"; Rubiks[1,3,2]="R"
Rubiks[1,1,3]="W"; Rubiks[1,2,3]="R"; Rubiks[1,3,3]="W"

# side face 2 rotate from face 1
Rubiks[2,1,1]="R"; Rubiks[2,2,1]="R"; Rubiks[2,3,1]="W"
Rubiks[2,1,2]="G"; Rubiks[2,2,2]="Y"; Rubiks[2,3,2]="O"
Rubiks[2,1,3]="B"; Rubiks[2,2,3]="G"; Rubiks[2,3,3]="O"

# rear face 3   rotate from face 2
Rubiks[3,1,1]="G"; Rubiks[3,2,1]="G"; Rubiks[3,3,1]="O"
Rubiks[3,1,2]="G"; Rubiks[3,2,2]="O"; Rubiks[3,3,2]="Y"
Rubiks[3,1,3]="B"; Rubiks[3,2,3]="O"; Rubiks[3,3,3]="R"

# side face 4   rotate from face 3
Rubiks[4,1,1]="G"; Rubiks[4,2,1]="W"; Rubiks[4,3,1]="W"
Rubiks[4,1,2]="B"; Rubiks[4,2,2]="W"; Rubiks[4,3,2]="W"
Rubiks[4,1,3]="G"; Rubiks[4,2,3]="W"; Rubiks[4,3,3]="R"

# top face 5      rotate from face 1
Rubiks[5,1,1]="G"; Rubiks[5,2,1]="Y"; Rubiks[5,3,1]="O"
Rubiks[5,1,2]="O"; Rubiks[5,2,2]="B"; Rubiks[5,3,2]="W"
Rubiks[5,1,3]="Y"; Rubiks[5,2,3]="Y"; Rubiks[5,3,3]="Y"

# bottom face 6     rotate to face 1
Rubiks[6,1,1]="Y"; Rubiks[6,2,1]="Y"; Rubiks[6,3,1]="O"
Rubiks[6,1,2]="R"; Rubiks[6,2,2]="G"; Rubiks[6,3,2]="B"
Rubiks[6,1,3]="R"; Rubiks[6,2,3]="B"; Rubiks[6,3,3]="B"

function display()     # display faces
    f = 1; g = 2; h = 3; i = 4; j = 5; k = 6
    println(" ")
    println(" ", Rubiks[j,1,3], " ", Rubiks[j,2,3], " ", Rubiks[j,3,3])
    println(" ", Rubiks[j,1,2], " ", Rubiks[j,2,2], " ", Rubiks[j,3,2])
    println(" ", Rubiks[j,1,1], " ", Rubiks[j,2,1], " ", Rubiks[j,3,1])
    println("_______")
    println(" ", Rubiks[f,1,3], " ", Rubiks[f,2,3], " ", Rubiks[f,3,3]," |", " ", Rubiks[g,1,3], " ", Rubiks[g,2,3], " ", Rubiks[g,3,3]," |", " ", Rubiks[h,1,3], " ", Rubiks[h,2,3], " ", Rubiks[h,3,3]," |", " ", Rubiks[i,1,3], " ", Rubiks[i,2,3], " ", Rubiks[i,3,3]," |")
    println(" ", Rubiks[f,1,2], " ", Rubiks[f,2,2], " ", Rubiks[f,3,2]," |", " ", Rubiks[g,1,2], " ", Rubiks[g,2,2], " ", Rubiks[g,3,2]," |", " ", Rubiks[h,1,2], " ", Rubiks[h,2,2], " ", Rubiks[h,3,2]," |", " ", Rubiks[i,1,2], " ", Rubiks[i,2,2], " ", Rubiks[i,3,2]," |")
    println(" ", Rubiks[f,1,1], " ", Rubiks[f,2,1], " ", Rubiks[f,3,1]," |", " ", Rubiks[g,1,1], " ", Rubiks[g,2,1], " ", Rubiks[g,3,1]," |", " ", Rubiks[h,1,1], " ", Rubiks[h,2,1], " ", Rubiks[h,3,1]," |", " ", Rubiks[i,1,1], " ", Rubiks[i,2,1], " ", Rubiks[i,3,1]," |")
    println("_______")
    println(" ", Rubiks[k,1,3], " ", Rubiks[k,2,3], " ", Rubiks[k,3,3])
    println(" ", Rubiks[k,1,2], " ", Rubiks[k,2,2], " ", Rubiks[k,3,2])
    println(" ", Rubiks[k,1,1], " ", Rubiks[k,2,1], " ", Rubiks[k,3,1])
end

display()

RubiksInitial=Rubiks


# Rubiks_vertical_faces = Rubiks[1:4,:,:] ; level = 2

function Rotate_right(level)

    temp=Rubiks[4, :, level]
#    Rotated = Rubiks_vertical_faces


    for m = 4:-1:2
        Rubiks[m, :, level] = Rubiks[m-1, :, level]
    end    
    Rubiks[1, :, level] = temp
end
#    return Rotated
#end

#Rubiks[1:4,:,:] = Rotated

#=

function Rotate(Rubiks, face, level, steps)
    # rotate >level< of >Rubiks< around axis through middle point of >face< >steps< times
    # if f = 5 face 1 is in front

    
    Rubiks_vertical_faces = Rubiks[1:4,:,:]

    if level == 2
        if steps >= 1
            Rubiks[1:4, :, level] = Rotate_right_vertical_faces(Rubiks_vertical_faces, level)
        end
    end

    return Rubiks
    
end

Rubiks = Rotate(Rubiks, 5, 2, 1)
=#

Rotate_right(2)
display()



function temperature(f)
    # temperature of face f

    T = 0

    j = 3   # upper row
    T += row_temperature(f,j)

    j = 2   # middle row
    T += up_temperature(f,j)
    T += row_temperature(f,j)
    T += down_temperature(f,j)

    j= 1    # low row
    T += row_temperature(f,j)

    return T
end

function row_temperature(f,j)
    T = 0
    if Rubiks[f,1,j] != Rubiks[f,2,j] T += 1 end
    if Rubiks[f,2,j] != Rubiks[f,3,j] T += 1 end
    return T
end

function up_temperature(f,j)
    T = 0
    for i = 1:3
        if Rubiks[f,i,j+1] != Rubiks[f,i,j]   T += 1 end
    end
    return T
end

function down_temperature(f,j)
    T = 0
    for i = 1:3
        if Rubiks[f,i,j-1] != Rubiks[f,i,j]   T += 1 end
    end
    return T
end

function temperature()
    T=0
    for f = 1:6
        println(" T(",f,") = ", temperature(f))
        T+=temperature(f)
    end
    return T
end

println("T = ",temperature())

#=
qikey='1'
while qikey != 's'
    qikey= readline()
    println(qikey)
end
=#