# Assembly
Assembly programs

---
## FAQ
- What happened to `ARM-Assembly`?
	- I would like to also add various architectures (like <code>AArch64</code>) from different Assembly programming languages. And that is why I renamed it to `Assembly`.

---
## Badges
- Github
	- Actions
		- `test`
			- [![.github/workflows/arm.yml](https://github.com/GrpeApple/Assembly/actions/workflows/arm.yml/badge.svg?branch=test)](https://github.com/GrpeApple/Assembly/actions/workflows/arm.yml)
			- [![.github/workflows/aarch64.yml](https://github.com/GrpeApple/Assembly/actions/workflows/aarch64.yml/badge.svg?branch=test)](https://github.com/GrpeApple/Assembly/actions/workflows/aarch64.yml)
	- License
		- [![license: MIT](https://img.shields.io/github/license/GrpeApple/Assembly)](LICENSE.md)

---
## Assembly

<table>
<thead>
	<tr>
		<th>Architecture</th>
		<th>Description</th>
		<th>Files</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>
			<code>ARM</code>
		</td>
		<td>ARM Assembly programs</td>
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
						<code>arm/</code>
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
												A symlink to <code>../../deps/int2str.S</code>
											</td>
										</tr>
									</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<code>bitwise_shift/</code>
								</td>
								<td>Shift numbers in bits</td>
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
												<code>bitwise_shift.S</code>
											</td>
											<td>
												Depends on <code>int2str.S</code> for integer to string conversion. (Bitwise shifted integer)
											</td>
										</tr>
										<tr>
											<td>
												<code>int2str.S</code>
											</td>
											<td>
												A symlink to <code>../../deps/int2str.S</code>
											</td>
										</tr>
									</tbody>
									</table>
								</td>
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
									<code>hello.S</code>
								</td>
								<td>
									Outputs <code>Hello, World!</code>
								</td>
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
									<code>looping/</code>
								</td>
								<td>Loops in ARM Assembly</td>
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
												<code>loop.S</code>
											</td>
											<td>
												Depends on <code>int2str.S</code> for integer to string conversion. (Loop integer)
											</td>
										</tr>
										<tr>
											<td>
												<code>int2str.S</code>
											</td>
											<td>
												A symlink to <code>../../deps/int2str.S</code>
											</td>
										</tr>
									</tbody>
									</table>
								</td>
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
									<code>stack.S</code>
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
									<code>arm/</code>
								</td>
								<td>ARM Dependencies for programs</td>
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
												<code>int2str.S</code>
											</td>
											<td>Modified <code>../../arm/int2str.S</code> for dependencies</td>
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
		</td>
	</tr>
	<tr>
		<td>
			<code>AArch64</code>
		</td>
		<td>AArch64 Assembly programs</td>
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
									<code>hello.S</code>
								</td>
								<td>
									Outputs <code>Hello, World!</code>
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
		</td>
	</tr>
</tbody>
</table>

---
## Build
### `make`
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
### Manual
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
