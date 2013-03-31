@files = <*.m4v>;


foreach $file (@files)
{
   @tv_show = split(/\./, $file);
   $name = $tv_show[0]; 
   $tv_show[1] =~ m/S([0-9]+)E([0-9]+)/ig;
   $season = $1;
   $episode = $2;

   push @{$show{$name}{$season}}, $episode;

}
foreach $key (sort keys %show) 
{
   foreach $seas (sort keys %{$show{$key}})
   {
      print "Show: " . $key . "\n\tSeason: " . $seas;
      foreach $epis (@{$show{$key}{$seas}})
      {
          print "\n\t\tEpisode: " . $epis;
      }
      print "\n";
   }
}
