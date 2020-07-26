<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class InventarioItem
 * 
 * @property int $idInventario
 * @property int $idItem
 * @property int $numeroLinea
 * @property string $descripcionItem
 * @property float $cantidad
 * @property float $costo
 * @property float $precio
 * @property float $impuesto
 * @property float $descuento
 * @property float $montoTotal
 * @property bool $esExento
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Inventario $inventario
 * @property Item $item
 *
 * @package App\Models
 */
class InventarioItem extends Model
{
	protected $table = 'inventario_item';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'idInventario' => 'int',
		'idItem' => 'int',
		'numeroLinea' => 'int',
		'cantidad' => 'float',
		'costo' => 'float',
		'precio' => 'float',
		'impuesto' => 'float',
		'descuento' => 'float',
		'montoTotal' => 'float',
		'esExento' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'numeroLinea',
		'descripcionItem',
		'cantidad',
		'costo',
		'precio',
		'impuesto',
		'descuento',
		'montoTotal',
		'esExento',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function inventario()
	{
		return $this->belongsTo(Inventario::class, 'idInventario');
	}

	public function item()
	{
		return $this->belongsTo(Item::class, 'idItem');
	}
}
