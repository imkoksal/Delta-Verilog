`timescale 1ns/1ps


module test_bench;
    reg clk;
    wire [3:0] ring_out;

    // Modülü çağırma
    ring_counter #(4) dut (
        .clk(clk),
        .ring_out(ring_out)
    );

    // Clock sinyali oluşturma
    always begin
        #5 clk = ~clk; // Her 5 zaman biriminde clk'yi ters çevir
    end

    // Giriş sinyallerini tanımlama ve test senaryosu oluşturma
    initial begin
        clk = 0;
        #200
        // Simülasyonu sonlandır
        $finish;
    end

    // Sonuçları görüntüleme
endmodule