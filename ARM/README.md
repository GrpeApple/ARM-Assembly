# ARM Assembly
ARM Assembly programs

---
## Programs
The sources are located in `src/` directory.
<table>
<thead>
	<tr>
		<th>Source</th>
		<th>Description</th>
		<th>Files</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>
			<code>arm</code>
		</td>
		<td>Programs that are assembled and linked directly.</td>
		<td>
			<table>
			<thead>
				<tr>
					<th>Program</th>
					<th>Description</th>
					<th>Files</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<code>E.S</code>
					</td>
					<td>
						Outputs <code>E</code> infinitely
					</td>
				</tr>
				<tr>
					<td>
						<code>arguments/</code>
					</td>
					<td>Outputs Argument Count and Value</td>
					<td>
						<table>
						<thead>
							<tr>
								<th>Dependencies</th>
								<th>Description</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<code>arguments.S</code>
								</td>
								<td>
									Depends on <code>int2str.S</code> for integer to string conversion. (Argument Count)
								</td>
							</tr>
							<tr>
								<td>
									<code>int2str.S</code>
								</td>
								<td>
									Modified version of <code>../int2str.S</code> for <code>arguments.S</code>
								</td>
							</tr>
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<code>bitwise_shift.S</code>
					</td>
					<td>Shift numbers in bits</td>
				</tr>
				<tr>
					<td>
						<code>buffer.S</code>
					</td>
					<td>My attempt at using buffers</td>
				</tr>
				<tr>
					<td>
						<code>fork.S</code>
					</td>
					<td>
						Forkbomb (Rabbit Virus) your system.<br>Do not worry, for I have added 3 warnings and confirmations. (1st and 2nd confirmation are y, Y. 3rd, you have to enter <code>Yes, please fork</code> which is case-sensetive.)<br> So you need not have to be that <em>worried</em>.
					</td>
				</tr>
				<tr>
					<td>
						<code>haha_ARM.S</code>
					</td>
					<td>Outputs 'haha, ARM.' My first program</td>
				</tr>
				<tr>
					<td>
						<code>int2str.S</code>
					</td>
					<td>Convert integer to string and print it.</td>
				</tr>
				<tr>
					<td>
						<code>link_register.S</code>
					</td>
					<td>My attempt at using functions with a link register</td>
				</tr>
				<tr>
					<td>
						<code>looping.S</code>
					</td>
					<td>Loops in ARM Assembly</td>
				</tr>
				<tr>
					<td>
						<code>mkdir.S</code>
					</td>
					<td>Create directories in ARM Assembly</td>
				</tr>
				<tr>
					<td>
						<code>no.S</code>
					</td>
					<td>Output 'no' infinitely</td>
				</tr>
				<tr>
					<td>
						<code>rm.S</code>
					</td>
					<td>Remove files and only files</td>
				</tr>
				<tr>
					<td>
						<code>rmdir.S</code>
					</td>
					<td>Remove directories (non-recursively)</td>
				</tr>
				<tr>
					<td>
						<codestack.S</code>
					</td>
					<td>Use the stack</td>
				</tr>
				<tr>
					<td>
						<code>uppercase.S</code>
					</td>
					<td>Uppercases characters</td>
				</tr>
			</tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<code>cc</code>
		</td>
		<td>Programs that depend on C (Libraries, functions, etc...)</td>
		<td>
			<table>
			<thead>
				<tr>
					<th>Program</th>
					<th>Description</th>
					<th>Files</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<code>printf.S</code>
					</td>
					<td>
						Depends on printf, prints <code>Hello, World!</code>
					</td>
				</tr>
			</tbody>
			</table>
		</td>
	</tr>
</tbody>
</table>

---
## Build
### make
Often, the `Makefile` has comments that are not here. Look for the comments when stuck.
If you are still stuck, Discuss on the `Discussion` tab above. (Assuming it exists and your client supports it)
#### Simple
###### Program
```bash
make <program>
```

###### Multiple programs
```bash
make <program> <program1> <program2> ... .. .
```

###### All programs
```bash
make all
```

##### Debug
```bash
make debug
```

###### Debug all programs
```bash
make debug all
```

or


```bash
make debugall
```

###### Run all
```bash
make runall
```

###### Clean assembled
```bash
make clean
```

###### Clean all
```bash
make cleanall
```

###### Run multiple commands
```bash
make cleanall haha_ARM runall
```

---
#### Advanced
##### Commands
###### Assembler
```bash
make AS=arm-linux-gnueabihf-as
```

###### Linker
```bash
make LD=arm-linux-gnueabihf-ld
```

###### Runner
```bash
make RUN=qemu-arm runall
```

###### C compiler
```bash
make CC=clang
```

###### Directories
```bash
make MKDIR=mkdir -p -v
```

###### Removing
```bash
make RM=rm -ri
```
##### Flags
###### ASFLAGS
```bash
make ASFLAGS=-g
```

###### LDFLAGS
```bash
make LDFLAGS=-S
```

###### CFLAGS
```bash
make CFLAGS=-Wall
```
##### Other
###### Source code extension
```bash
make SDEXT=.S
```
###### AS Binary Extension
```bash
make ASEXT=o
```
###### LD Binary extension
```bash
make LDEXT=.bin
```
###### Sources
```bash
make SD=yes PROGRAM=no
```
---
### Manual
Make sure you are in your src
###### Single program
```bash
as -o <program>.o <program>.S
ld -o <program> <program>.o
```

###### Multiple dependencies
```bash
as -o <program>.o <program>.S
as -o <program1>.o <program1>.S
as -o <program2>.o <program2>.S
as -o <program3>.o <program3>.S
as -o <program4>.o <program4>.S
as -o <program5>.o <program5>.S
ld -o <program> \
<program> \
<program1> \
<program2> \
<program3> \
<program4> \
<program5>
```

###### debug (gdb)
```bash
as -g -o <program>.o <program>.S
ld -o <program> <program>.o
gdb ./<program>
```

###### Run all
```bash
./*
```

###### Binary extension
```
as -o <program>.o <program>.S
ld -o <program>.bin <program>.S
```
