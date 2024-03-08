using System;

public class NQueens
{
    private int[] queens; // Posiciones de las reinas en el tablero
    private int size; // Tamaño del tablero

    public NQueens(int size)
    {
        this.size = size;
        queens = new int[size];
        Array.Fill(queens, -1); // Inicializa el tablero con todas las reinas fuera del tablero (-1)
    }

    // Método para verificar si una posición está segura para colocar una reina
    private bool IsSafe(int row, int col)
    {
        // Verificar si hay otra reina en la misma columna o diagonal
        for (int i = 0; i < row; i++)
        {
            if (queens[i] == col || Math.Abs(i - row) == Math.Abs(queens[i] - col))
            {
                return false;
            }
        }
        return true;
    }

    // Método para colocar una reina en una fila dada
    private bool PlaceQueen(int row)
    {
        if (row == size)
        {
            return true; // Se han colocado todas las reinas
        }
        for (int col = 0; col < size; col++)
        {
            if (IsSafe(row, col))
            {
                queens[row] = col; // Coloca una reina en la posición (row, col)
                if (PlaceQueen(row + 1))
                {
                    return true;
                }
                //queens[row] = -1;

            }
        }
        return false; // No se pudo colocar una reina en esta fila
    }

    // Método para resolver el problema de las N reinas
    public bool Solve()
    {
        return PlaceQueen(0); // Empieza a colocar reinas desde la fila 0
    }

    // Método para imprimir el tablero con las reinas colocadas
    public void PrintBoard()
    {
        for (int i = 0; i < size; i++)
        {
            for (int j = 0; j < size; j++)
            {
                if (queens[i] == j)
                {
                    Console.Write("Q ");
                }
                else
                {
                    Console.Write("_ ");
                }
            }
            Console.WriteLine();
        }
    }

    public static void Main(string[] args)
    {
        Console.WriteLine("Ingrese el numero de reinas que desea colocar");
        int boardSize = Convert.ToInt32(Console.ReadLine()); // Tamaño del tablero de ajedrez
        NQueens nQueens = new NQueens(boardSize);
        if (nQueens.Solve())
        {
            Console.WriteLine("Solución encontrada:");
            nQueens.PrintBoard();
        }
        else
        {
            Console.WriteLine("No se encontró solución para " + boardSize + " reinas.");
        }
    }
}

