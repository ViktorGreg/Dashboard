<?php
// Menu data
$menuItems = [
  [
    'icon' => 'airplay',
    'label' => 'Dashboard',
    'href' => '/staff-and-scheduling/index.php',
  ],
  [
    'icon' => 'table-2',
    'label' => 'Wards',
    'href' => '/staff-and-scheduling/wards.php',
  ],
  [
    'icon' => 'calendar',
    'label' => 'Scheduling',
    'href' => '/staff-and-scheduling/scheduling.php',
  ],
  [
    'icon' => 'contact',
    'label' => 'Create Patients',
    'href' => '/staff-and-scheduling/patients.php',
  ],
  [
    'icon' => 'list',
    'label' => 'Patient list',
    'href' => '/staff-and-scheduling/patientList.php',
  ],
  [
    'icon' => 'cart',
    'label' => 'order',
    'href' => '/staff-and-scheduling/patients.php',
  ],
  [
    'icon' => 'inventory',
    'label' => 'inventory',
    'href' => '/staff-and-scheduling/itemList.php',
  ],
  [
    'icon' => 'list',
    'label' => 'Physician List',
    'href' => '/staff-and-scheduling/physicianList.php',
  ],
  [
    'icon' => 'staff',
    'label' => 'staff',
    'href' => '/staff-and-scheduling/staffList.php',
  ],
  [
    'icon' => 'Vendors',
    'label' => 'Vendors',
    'href' => '/staff-and-scheduling/patients.php',
  ],
  [
    'icon' => 'Log out',
    'label' => 'Log out',
    'href' => '/staff-and-scheduling/patients.php',
  ],
];

// Get current path (assuming you're using this in a web server context)
$currentPath = $_SERVER['REQUEST_URI'];
?>

<div class="drawer-side">
  <label for="sidebar" aria-label="close sidebar" class="drawer-overlay"></label>
  <ul class="menu bg-base-100 border-r text-base-content min-h-full w-80 p-4">
    <?php foreach ($menuItems as $item): ?>
      <li>
        <a href="<?= $item["href"] ?>" class="<?= $item['href'] === $currentPath ? 'bg-base-300' : ''; ?>">
          <div class="flex items-center gap-2">
            <i data-lucide="<?= $item['icon']; ?>" class="h-4 w-4"></i>
            <?= htmlspecialchars($item['label']); ?>
          </div>
        </a>
      </li>
    <?php endforeach; ?>
  </ul>
</div>