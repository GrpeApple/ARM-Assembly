# ARM Assembly
All my ARM Assembly programs
## Programs
<table>
<thead>
	<tr>
		<th>Program</th>
		<th>Description</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>
			<code>E.S</code>
		</td>
    		<td>Output 'E' infinitely</td>
	</tr>
	<tr>
		<td>
			<code>arguments.S</code>
		</td>
		<td>Outputs Argument length and content</td>
	</tr>
	<tr>
		<td>
			<code>bitwise_shift.S</code>
		</td>
	<td>Shift numbers in bits</td>
	</tr>
	<tr>
		<td>
			<code>fork.S</code>
		</td>
		<td>Forkbomb (Rabbit Virus) your system</td>
	</tr>
	<tr>
		<td>
			<code>haha_ARM.S</code>
		</td>
		<td>Outputs 'haha, ARM.' My first program</td>
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
			<code>uppercase.S</code>
		</td>
		<td>Uppercases characters</td>
	</tr>
</tbody>
</table>

## Build
### make
Build a single program
```bash
make <program>
```

Build multiple programs
```bash
make <program> <program1> <program2> ... .. .
```

Build all programs
```bash
make all
```

Build all programs with debug
```bash
make debugall
```

Clean assembled objects
```bash
make clean
```

Clean all built programs and assembled objects
```bash
make cleanall
```

### Manual
Build a single standalone program
```bash
as -o <program>.o <program>.S
ld -o <program> <program>.o
```

Build a single program with multiple dependencies
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

Build with debug
```bash
as -go <program>.o <program>.S
ld -o <program> <program>.o
gdb ./<program>
```
