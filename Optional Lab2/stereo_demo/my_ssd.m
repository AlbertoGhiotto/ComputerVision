function d = my_ssd(N1,N2)

d = - sum(sum(N1-N2).^2);

end