from django.db import models

# Create your models here.


class Song(models.Model):
    title = models.CharField(max_length=200)
    artist = models.CharField(max_length=200)
    album_title = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return f"{self.title} by {self.artist}"
