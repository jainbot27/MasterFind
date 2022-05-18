package com.company;

import javax.swing.*;

public class Main {

    static int length = 4;

    public static String get(int[] A, int[] B) {
        int counter = 0;
        char[] array = new char[length]; // returns the values for the array after comparing
        for (int i = 0; i < length; i++) {
            if (A[i] == B[i]) {
                array[counter++] = 'R';
            }
        }
        for (int i = 0; i < length; i++) {
            for (int j = i + 1; j < length; j++) {
                if (A[i] == A[j]) {
                    array[counter++] = 'W';
                }
            }
        }
        while (counter < length) {
            array[counter++] = 'N';
        }
        return new String(array);
    }


    public static void main(String[] args) {
        JFrame f = new JFrame();
        JButton b = new JButton("click");
        b.setBounds(130, 100, 100, 40);
        f.add(b);
        f.setSize(400, 500);
        f.setLayout(null);
        f.setVisible(true);
    }
}
