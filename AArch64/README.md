# AArch64 Assembly
AArch64 Assembly programs

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
			<code>aarch64/</code>
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
			</tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<code>cc/</code>
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
	<tr>
		<td>
			<code>deps/</code>
		</td>
		<td>Global Dependencies for programs, they are usually symlinked to here.</td>
		<td>
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
						<code>aarch64/</code>
					</td>
					<td>AArch64 Dependencies for programs</td>
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
							</tr>
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<code>cc/</code>
					</td>
					<td>Dependencies that depend on C (Libraries, functions, etc...) for programs</td>
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
							</tr>
						</tbody>
						</table>
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
make cleanall E runall
```

---
#### Advanced
##### Commands
###### Assembler
```bash
make AS=aarch64-linux-gnu-as
```

###### Linker
```bash
make LD=aarch64-linux-gnu-ld
```

###### Runner
```bash
make RUN=qemu-aarch64 runall
```

###### C compiler
```bash
make CC=aarch64-linux-gnu-gcc
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
