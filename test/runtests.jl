using DataFrames
using Test
using TextIO


@testset verbose = true "TextIO" begin
    @testset "CSV" begin
        df = DataFrames.DataFrame();
        df[!,"A"] = rand(5);
        df[!,"B"] = rand(5);

        TextIO.save_csv!("test1.csv", df);
        @test true;
        TextIO.save_csv!(df, "test2.csv");
        @test true;

        TextIO.read_csv("test1.csv");
        @test true;
        TextIO.read_csv("test2.csv"; skiprows = 1);
        @test true;

        rm("test1.csv");
        rm("test2.csv");
    end;
end;
