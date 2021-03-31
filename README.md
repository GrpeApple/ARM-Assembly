# Assembly
Assembly programs

----
## FAQ
- What happened to `ARM-Assembly`?
	- I would like to also add various architectures (like <code>AArch64</code>) from different Assembly programming languages. And that is why I renamed it to `Assembly`.

----
## Badges
- Github
	- Actions
		- `test`
			- [![.github/workflows/arm.yml](https://github.com/GrpeApple/Assembly/actions/workflows/arm.yml/badge.svg?branch=test)](https://github.com/GrpeApple/Assembly/actions/workflows/arm.yml)
			- [![.github/workflows/aarch64.yml](https://github.com/GrpeApple/Assembly/actions/workflows/aarch64.yml/badge.svg?branch=test)](https://github.com/GrpeApple/Assembly/actions/workflows/aarch64.yml)
	- License
		- [![license: MIT](https://img.shields.io/github/license/GrpeApple/Assembly)](LICENSE.md)

----
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
												A symlink to <code>../../deps/arm/int2str.S</code>
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
												A symlink to <code>../../deps/arm/int2str.S</code>
											</td>
										</tr>
									</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<code>flush.S</code>
								</td>
								<td>Flushes anything from stdin to a buffer; this is very useful if you want the user to not enter an extra command to the terminal.</td>
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
												A symlink to <code>../../deps/arm/int2str.S</code>
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
											<td>Modified <code>../../arm/int2str.S</code> for programs that depend.</td>
										</tr>
										<tr>
											<td>
												<code>flush.S</code>
											</td>
											<td>Modified <code>../../arm/flush.S</code> for programs that depend.</td>
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

----
## Build
### `make`
Often, the `Makefile` has comments that are not here. Look for the comments when stuck.
If you are still stuck, Discuss on the `Discussion` tab above. (Assuming it exists and your client supports it)
The following table assumes you:
- Installed `make`.
- On an Architecture (like `ARM`) folder.
- The `Makefile` exists.
- On GNU Make (Might work on other versions).
	- Version 4.3 (Might work on other versions).
- Have an assembler (like `as`) and compiler (like `gcc`) installed.

Run the commands with `make [command]`.
Things in "()" enclosed with `$()` are variables in the Makefile. Otherwise, they represent a command or flag or a description; depending on the context.

-----

<table>
<thead>
	<tr>
		<th>Action</th>
		<th>Command</th>
		<th>Description</th>
		<th>Notes</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td></td>
		<td></td>
		<td>
			Runs the first target (<code>help</code>)
		</td>
		<td></td>
	</tr>
	<tr>
		<td>Help</td>
		<td>
			<code>help</code>
		</td>
		<td>
			Shows a help message. (<code>HELP_MESSAGE</code>)
		</td>
		<td></td>
	</tr>
	<tr>
		<td>Debug</td>
		<td>
			<code>debug[arch]</code>
		</td>
		<td>
			Adds a debug (<code>-g</code>) flag (<code>$(ASFLAGS)</code> or <code>$(CCFLAGS)</code> when specifying the <code>[arch]</code>) to the Assembler (<code>$(AS)</code>) or Compiler (<code>$(CC)</code>); allowing debugging.
		</td>
		<td>
			<code>[arch]</code> is optional.
		</td>
	</tr>
	<tr>
		<td>All</code>
		<td>
			<code>all[arch]</code>
		</td>
		<td>
			Creates directories (<code>$(MKDIR)</code>) for Building (<code>$(BUD)</code>) and Linking (<code>$(BID)</code>).<br>Assemble (<code>$(AS)</code> or Compile (<code>$(CC)</code>) and Link (<code>LD</code> or <code>CL</code>) all programs (<code>$(SD)</code> for all; <code>$(ASD)</code> or <code>$(CSD)</code> when specifying the <code>[arch]</code>).
		</td>
		<td>
			<code>[arch]</code> is optional.
		</td>
	</tr> <tr>
		<td>Debug All</td>
		<td>
			<code>debugall[arch]</code>
		</td>
		<td>
			Same as <strong>All</strong> but adds a debug (<code>-g</code>) flag (<code>$(ASFLAGS)</code> or <code>$(CCFLAGS)</code> when specifying the <code>[arch]</code>); allowing debugging.
		</td>
		<td>
			<code>[arch]</code> is optional.
		</td>
	</tr>
	<tr>
		<td>Run All</td>
		<td>
			<code>runall[arch]</code>
		</td>
		<td>
			Run (<code>$(RUN)</code>) all programs (<code>$(BID)</code> for all; <code>$(ABID)</code> or <code>$(CBID)</code> when specifying the <code>[arch]</code>); it will display a message (<code>RUN_MESSAGE</code>) when a specified architecture (<code>[arch]</code>) does not exist.
		</td>
		<td>
			<code>[arch]</code> is optional.
			To run (<code>$(RUN)</code>) all programs (<code>$(BID)</code> for all; <code>$(ABID)</code> or <code>$(CBID)</code> when specifying the <code>[arch]</code>) however, you need execute permissions.
		</td>
	</tr>
		<td>Clean</td>
		<td>
			<code>clean[arch]</code>
		</td>
		<td>
			Cleans (<code>$(RM)</code>) object files (<code>$(BUD)</code> for all; <code>$(ABUD)</code> or <code>$(CBUD)</code> when specifying the <code>[arch]</code>).
		</td>
		<td>
			<code>[arch]</code> is optional.
			To remove (<code>$(RM)</code>) however, you need write permissions.
		</td>
	<tr>
		<td>Clean all</td>
		<td>
			<code>cleanall[arch]</code>
		</td>
		<td>
			Cleans (<code>$(RM)</code>) object files (<code>$(BUD)</code> for all; <code>$(ABUD)</code> or <code>$(CBUD)</code> when specifying the <code>[arch]</code>) and programs (<code>$(BID)</code> for all; <code>$(ABID)</code> or <code>$(CBID)</code> when specifying the <code>[arch]</code>).
		</td>
		<td>
			<code>[arch]</code> is optional.
			To remove (<code>$(RM)</code>) however, you need write permissions.
		</td>
	</tr>
</tbody>
</table>

-----
### Manual

<table>
<thead>
	<tr>
		<th>Action</th>
		<th>Command</th>
		<th>Description</th>
		<th>Notes</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>Single program</td>
		<td>
			<pre><code>
as -o [program].o [program].S
ld -o [program] [program].o
			</code></pre>
		</td>
		<td>Command for assembling and linking a single program</td>
		<td></td>
	</tr>
	<tr>
		<td>Multiple dependencies</td>
		<td>
			<pre><code>
as -o [program].o [program].S
as -o [program1].o [program1].S
as -o [program2].o [program2].S
as -o [program3].o [program3].S
as -o [program4].o [program4].S
as -o [program5].o [program5].S
ld -o [program] \
[program].o \
[program1].o \
[program2].o \
[program3].o \
[program4].o \
[program5].o
			</code></pre>
		</td>
		<td>Command for assembling and linking programs that depend on other programs</td>
		<td>
			You can eliminate the need of <code>/</code> to stay it on a single line, like <code>ld -o [program] [program].o [program1].o [program2].o [program3].o [program4].o [program5].o</code> it is just for readability. You can further shorten it (if your shell supports it) with <code>ld -o ]program] {[program],[program1],[program2],[program3],[program4],[program5]}.o</code>.
		</td>
	</tr>
	<tr>
		<td>Debug</td>
		<td>
			<pre><code>
as -g -o [program].o [program].S
ld -o [program] [program].o
			</code></pre>
		</td>
		<td>
			Debug with the flag <code>-g</code> if your device supports it.
		</td>
		<td>
			You can use a debugger like <code>gdb</code> to debug a certain program.
		</td>
	</tr>
</tbody>
</table>
