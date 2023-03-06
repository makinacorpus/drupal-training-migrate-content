<?php

declare(strict_types=1);

namespace Drupal\training_migrate_content\EventSubscriber;

use Drupal\Core\Entity\EntityTypeManager;
use Drupal\file\Entity\File;
use Drupal\image\Entity\ImageStyle;
use Drupal\migrate\Event\MigrateEvents;
use Drupal\migrate\Event\MigrateImportEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class TrainingMigrateContentEvents implements EventSubscriberInterface {

  /** @var \Drupal\Core\Entity\EntityTypeManager */
  private $entityTypeManager;

  public function __construct(EntityTypeManager $entityTypeManager) {
    $this->entityTypeManager = $entityTypeManager;
  }

  public static function getSubscribedEvents() {
    $events[MigrateEvents::POST_IMPORT][] = ['onPostImport'];

    return $events;
  }

  public function onPostImport(MigrateImportEvent $event): void {
    // Create thumbnail preview images.
    if ('migrate_content_media' === $event->getMigration()->id()) {
      $images = $this->entityTypeManager
        ->getStorage('file')
        ->loadMultiple();
      /** @var ImageStyle */
      $thumbnail = $this->entityTypeManager
        ->getStorage('image_style')
        ->load('thumbnail');
      foreach ($images as $fid => $image) {
        \assert($image instanceof File);
        $uri = $image->getFileUri();
        $destination = $thumbnail->buildUri($uri);
        $thumbnail->createDerivative($uri, $destination);
      }
    }
  }
}
